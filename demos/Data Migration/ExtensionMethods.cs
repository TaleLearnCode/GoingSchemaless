namespace Data_Migration;

internal static class ExtensionMethods
{


	internal static TaleLearnCode.GoingSchemaless.Schemaless.Models.Country ToCosmosModel(this TaleLearnCode.GoingSchemaless.Repository.Models.Country country, string id)
	{
		return new()
		{
			Id = id,
			MetadataType = "Country",
			Code = country.CountryCode,
			Name = country.CountryName,
			WorldRegion = country.WorldRegionCodeNavigation.ToCosmosComponent(),
			WorldSubregion = country.WorldSubregionCodeNavigation.ToCosmosComponent(),
			HasDivisions = country.HasDivisions,
			DivisionName = country.DivisionName,
			CountryDivisions = country.CountryDivisions.ToCosmosComponentList()
		};
	}

	internal static TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivision ToCosmosModel(this TaleLearnCode.GoingSchemaless.Repository.Models.CountryDivision countryDivision, string id)
		=> new()
		{
			Id = id,
			MetadataType = "CountryDivision",
			Code = countryDivision.CountryDivisionCode,
			CountryCode = countryDivision.CountryCode,
			Name = countryDivision.CountryDivisionName,
			CategoryName = countryDivision.CategoryName,
			Country = countryDivision.CountryCodeNavigation.ToCosmosComponent()
		};

	internal static TaleLearnCode.GoingSchemaless.Schemaless.Models.Currency ToCosmosModel(this TaleLearnCode.GoingSchemaless.Repository.Models.Currency currency, string id)
		=> new()
		{
			Id = id,
			MetadataType = "Currency",
			Code = currency.CurrencyCode,
			Number = currency.CurrencyNumber,
			Name = currency.CurrencyName,
			Countries = currency.CurrencyCountries.ToCosmosComponentList(),
		};

	internal static TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryComponent ToCosmosComponent(this TaleLearnCode.GoingSchemaless.Repository.Models.Country country)
		=> new()
		{
			Code = country.CountryCode,
			Name = country.CountryName
		};

	internal static TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryComponent ToCosmosComponent(this TaleLearnCode.GoingSchemaless.Repository.Models.CurrencyCountry currencyCountry)
		=> new()
		{
			Code = currencyCountry.CountryCode,
			Name = currencyCountry.CountryCodeNavigation.CountryName
		};

	internal static TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivisionComponent ToCosmosComponent(this TaleLearnCode.GoingSchemaless.Repository.Models.CountryDivision countryDivision)
		=> new()
		{
			Code = countryDivision.CountryCode,
			Name = countryDivision.CountryDivisionName,
			CategoryName = countryDivision.CategoryName
		};

	internal static TaleLearnCode.GoingSchemaless.Schemaless.Models.WorldRegionComponent? ToCosmosComponent(this TaleLearnCode.GoingSchemaless.Repository.Models.WorldRegion? worldRegion)
	{
		if (worldRegion is not null)
			return new()
			{
				Code = worldRegion.WorldRegionCode,
				Name = worldRegion.WorldRegionName
			};
		else return null;
	}

	internal static List<TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivisionComponent> ToCosmosComponentList(this ICollection<TaleLearnCode.GoingSchemaless.Repository.Models.CountryDivision> countryDivisions)
	{
		List<TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryDivisionComponent> response = new();
		foreach (TaleLearnCode.GoingSchemaless.Repository.Models.CountryDivision countryDivision in countryDivisions)
			response.Add(countryDivision.ToCosmosComponent());
		return response;
	}

	internal static List<TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryComponent> ToCosmosComponentList(this ICollection<TaleLearnCode.GoingSchemaless.Repository.Models.CurrencyCountry> countries)
	{
		List<TaleLearnCode.GoingSchemaless.Schemaless.Models.CountryComponent> response = new();
		foreach (TaleLearnCode.GoingSchemaless.Repository.Models.CurrencyCountry country in countries)
			response.Add(country.ToCosmosComponent());
		return response;
	}

}