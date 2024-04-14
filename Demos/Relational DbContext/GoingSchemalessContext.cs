#nullable disable


namespace TaleLearnCode.GoingSchemaless.Repository;

public class GoingSchemalessContext : DbContext
{

	private readonly string _databasePassword = string.Empty;

	public GoingSchemalessContext(string databasePassword) => _databasePassword = databasePassword;

	public GoingSchemalessContext(DbContextOptions<GoingSchemalessContext> options) : base(options) { }

	protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
	{
		if (!optionsBuilder.IsConfigured)
			optionsBuilder.UseSqlServer($"Data Source=sql-buildingbricks-use2.database.windows.net;Initial Catalog=sqldb-buildingbricks-use2;Persist Security Info=True;User ID=SQLAdmin;Password={_databasePassword}");
	}

	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		CreateModel.Content(modelBuilder);
		CreateModel.ContentCopy(modelBuilder);
		CreateModel.ContentType(modelBuilder);
		CreateModel.Country(modelBuilder);
		CreateModel.CountryDivision(modelBuilder);
		CreateModel.Currency(modelBuilder);
		CreateModel.CurrencyCountry(modelBuilder);
		CreateModel.Customer(modelBuilder);
		CreateModel.CustomerAddress(modelBuilder);
		CreateModel.CustomerOrder(modelBuilder);
		CreateModel.CustomerOrderItem(modelBuilder);
		CreateModel.Language(modelBuilder);
		CreateModel.LanguageCulture(modelBuilder);
		CreateModel.OrderStatus(modelBuilder);
		CreateModel.Product(modelBuilder);
		CreateModel.ProductAvailability(modelBuilder);
		CreateModel.ProductPrice(modelBuilder);
		CreateModel.ProductTheme(modelBuilder);
		CreateModel.Theme(modelBuilder);
		CreateModel.WorldRegion(modelBuilder);
	}

	public virtual DbSet<Content> Contents { get; set; }
	public virtual DbSet<ContentCopy> ContentCopies { get; set; }
	public virtual DbSet<ContentType> ContentTypes { get; set; }
	public virtual DbSet<Country> Countries { get; set; }
	public virtual DbSet<CountryDivision> CountryDivisions { get; set; }
	public virtual DbSet<Currency> Currencies { get; set; }
	public virtual DbSet<CurrencyCountry> CurrencyCountries { get; set; }
	public virtual DbSet<Customer> Customers { get; set; }
	public virtual DbSet<CustomerAddress> CustomerAddresses { get; set; }
	public virtual DbSet<CustomerOrder> CustomerOrders { get; set; }
	public virtual DbSet<CustomerOrderItem> CustomerOrderItems { get; set; }
	public virtual DbSet<Language> Languages { get; set; }
	public virtual DbSet<LanguageCulture> LanguageCultures { get; set; }
	public virtual DbSet<OrderStatus> OrderStatuses { get; set; }
	public virtual DbSet<Product> Products { get; set; }
	public virtual DbSet<ProductAvailability> ProductAvailabilities { get; set; }
	public virtual DbSet<ProductPrice> ProductPrices { get; set; }
	public virtual DbSet<ProductTheme> ProductThemes { get; set; }
	public virtual DbSet<Theme> Themes { get; set; }
	public virtual DbSet<WorldRegion> WorldRegions { get; set; }

}