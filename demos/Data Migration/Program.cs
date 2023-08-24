using Data_Migration;
using Microsoft.Azure.Cosmos;
using Microsoft.EntityFrameworkCore;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

PrintBanner();

JsonSerializerOptions jsonSerializerOptions = BuildJsonSerializerOptions();

//using CosmosClient cosmosClient = new("https://cosmos-goingschemaless.documents.azure.com:443/", Environment.GetEnvironmentVariable("GoingSchemaless_CosmosKey")!);
using CosmosClient cosmosClient = new("https://cosmos-goingschemaless.documents.azure.com:443/", "LU602GMEIQKAXzYxtoTE8X7SeqVXFzVJUdXedHUPG3tbzzVUoLA6ZKsnQ5j1Hp2WOdBXI5PHzSXrACDbIRtUXQ==");
Database database = await ConnectToDatabaseAsync("BuildingBricks");

Container metadataContainer = await ConnectToContainerAsync("Metadata", "/metadataType");
using TaleLearnCode.GoingSchemaless.Repository.GoingSchemalessContext relationalContext = new(GetDatabasePassword());

await LoadCountriesAsync();
await LoadCountryDivisionsAsync();
await LoadCurrenciesAsync();

static string GetDatabasePassword()
{
	Console.Write("Password: ");
	StringBuilder password = new StringBuilder();
	while (true)
	{
		var key = Console.ReadKey(true);
		if (key.Key == ConsoleKey.Enter)
			break;
		password.Append(key.KeyChar);
		Console.Write("*");
	}
	Console.WriteLine();
	return password.ToString();
}

static void PrintBanner()
{
	Console.ForegroundColor = ConsoleColor.Yellow;
	Console.WriteLine();
	Console.WriteLine(@"   ________          __              _____  .__                     __  .__               ");
	Console.WriteLine(@"   \______ \ _____ _/  |______      /     \ |__| ________________ _/  |_|__| ____   ____  ");
	Console.WriteLine(@"    |    |  \\__  \\   __\__  \    /  \ /  \|  |/ ___\_  __ \__  \\   __\  |/  _ \ /    \ ");
	Console.WriteLine(@"    |    `   \/ __ \|  |  / __ \_ /    Y    \  / /_/  >  | \// __ \|  | |  (  <_> )   |  \");
	Console.WriteLine(@"   /_______  (____  /__| (____  / \____|__  /__\___  /|__|  (____  /__| |__|\____/|___|  /");
	Console.WriteLine(@"           \/     \/          \/          \/  /_____/            \/                    \/ ");
	Console.WriteLine();
	Console.WriteLine();
	Console.ResetColor();
}

static void PrintModuleBanner(string module)
{
	Console.WriteLine();
	Console.ForegroundColor = ConsoleColor.Blue;
	Console.WriteLine($"Loading {module}");
	Console.ResetColor();
}

static JsonSerializerOptions BuildJsonSerializerOptions()
	=> new()
	{
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
		DictionaryKeyPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true
	};

async Task<Database> ConnectToDatabaseAsync(string id)
{
	Database database = await cosmosClient.CreateDatabaseIfNotExistsAsync(id);
	Console.WriteLine($"Database Connected:\t{database.Id}");
	return database;
}

async Task<Container> ConnectToContainerAsync(string id, string partitionKeyPath)
{
	Container container = await database.CreateContainerIfNotExistsAsync(id, partitionKeyPath);
	Console.WriteLine($"Container Connected:\t{container.Id}");
	return container;
}

async Task<Dictionary<int, T>> RetrieveMetadataByLegacyIdAsync<T>(string metadataType) where T : TaleLearnCode.GoingSchemaless.Schemaless.Models.MetadataBase
{
	Dictionary<int, T> response = new();
	using FeedIterator<T> feed = metadataContainer.GetItemQueryIterator<T>($"SELECT * FROM metadata");
	while (feed.HasMoreResults)
	{
		FeedResponse<T> feedResponse = await feed.ReadNextAsync();
		foreach (T item in feedResponse)
		{
			if (item.MetadataType == metadataType)
				response.Add(item.LegacyId, item);
		}
	}
	return response;
}

async Task LoadCountriesAsync()
{
	PrintModuleBanner("countries");

	Dictionary<string, TaleLearnCode.GoingSchemaless.Schemaless.Models.Country> existingSchemalessCountries = new();
	using FeedIterator<TaleLearnCode.GoingSchemaless.Schemaless.Models.Country> feed = metadataContainer.GetItemQueryIterator<TaleLearnCode.GoingSchemaless.Schemaless.Models.Country>($"SELECT * FROM metadata");
	while (feed.HasMoreResults)
	{
		FeedResponse<TaleLearnCode.GoingSchemaless.Schemaless.Models.Country> feedResponse = await feed.ReadNextAsync();
		foreach (TaleLearnCode.GoingSchemaless.Schemaless.Models.Country item in feedResponse)
		{
			if (item.MetadataType == "Country")
				existingSchemalessCountries.Add(item.Code, item);
		}
	}

	List<TaleLearnCode.GoingSchemaless.Repository.Models.Country> relationalCountries = await relationalContext.Countries
		.Include(x => x.WorldRegionCodeNavigation)
		.Include(x => x.WorldSubregionCodeNavigation)
		.Include(x => x.CountryDivisions)
		.ToListAsync();

	foreach (TaleLearnCode.GoingSchemaless.Repository.Models.Country relationalCountry in relationalCountries)
	{
		if (!existingSchemalessCountries.ContainsKey(relationalCountry.CountryCode))
		{
			TaleLearnCode.GoingSchemaless.Schemaless.Models.Country createdItem
				= await metadataContainer.CreateItemAsync(relationalCountry.ToCosmosModel(Guid.NewGuid().ToString()), new PartitionKey("Country"));
			Console.WriteLine($"\t{createdItem.Id}\t{createdItem.Name}");
		}
	}




}

async Task LoadCountryDivisionsAsync()
{
	PrintModuleBanner("countryDivisions");

	Dictionary<(string, string), TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivision> existingSchemalessCountryDivisions = new();
	using FeedIterator<TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivision> feed = metadataContainer.GetItemQueryIterator<TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivision>($"SELECT * FROM metadata");
	while (feed.HasMoreResults)
	{
		FeedResponse<TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivision> feedResponse = await feed.ReadNextAsync();
		foreach (TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivision item in feedResponse)
		{
			if (item.MetadataType == "CountryDivision")
				existingSchemalessCountryDivisions.Add((item.CountryCode, item.Code), item);
		}
	}

	List<TaleLearnCode.GoingSchemaless.Repository.Models.CountryDivision> relationalCountryDivisions = await relationalContext.CountryDivisions
		.Include(x => x.CountryCodeNavigation)
		.ToListAsync();

	foreach (TaleLearnCode.GoingSchemaless.Repository.Models.CountryDivision relationalCountryDivision in relationalCountryDivisions)
	{
		if (!existingSchemalessCountryDivisions.ContainsKey((relationalCountryDivision.CountryCode, relationalCountryDivision.CountryDivisionCode)))
		{
			TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivision createdItem
				= await metadataContainer.CreateItemAsync(relationalCountryDivision.ToCosmosModel(Guid.NewGuid().ToString()), new PartitionKey("CountryDivision"));
			Console.WriteLine($"\t{createdItem.Id}\t{createdItem.Country.Name} — {createdItem.Name}");
		}
	}




}

async Task LoadCurrenciesAsync()
{
	PrintModuleBanner("Currencies");

	Dictionary<string, TaleLearnCode.GoingSchemaless.Schemaless.Models.Currency> existingSchemalessCurrencies = new();
	using FeedIterator<TaleLearnCode.GoingSchemaless.Schemaless.Models.Currency> feed = metadataContainer.GetItemQueryIterator<TaleLearnCode.GoingSchemaless.Schemaless.Models.Currency>($"SELECT * FROM metadata");
	while (feed.HasMoreResults)
	{
		FeedResponse<TaleLearnCode.GoingSchemaless.Schemaless.Models.Currency> feedResponse = await feed.ReadNextAsync();
		foreach (TaleLearnCode.GoingSchemaless.Schemaless.Models.Currency item in feedResponse)
		{
			if (item.MetadataType == "Currency")
				existingSchemalessCurrencies.Add(item.Code, item);
		}
	}

	List<TaleLearnCode.GoingSchemaless.Repository.Models.Currency> relationalCurrencies = await relationalContext.Currencies
		.Include(x => x.CurrencyCountries)
			.ThenInclude(x => x.CountryCodeNavigation)
		.ToListAsync();

	foreach (TaleLearnCode.GoingSchemaless.Repository.Models.Currency relationalCurrency in relationalCurrencies)
	{
		if (!existingSchemalessCurrencies.ContainsKey(relationalCurrency.CurrencyCode))
		{
			TaleLearnCode.GoingSchemaless.Schemaless.Models.Currency createdItem
				= await metadataContainer.CreateItemAsync(relationalCurrency.ToCosmosModel(Guid.NewGuid().ToString()), new PartitionKey("Currency"));
			Console.WriteLine($"\t{createdItem.Id}\t{createdItem.Name}");
		}
	}




}
