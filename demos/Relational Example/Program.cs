using GoingSchemalessContext context = new(GetDatabasePassword());
List<Product> products = await context.Products.ToListAsync();
foreach (Product product in products)
	Console.WriteLine($"{product.ProductId} — {product.ProductName}");

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