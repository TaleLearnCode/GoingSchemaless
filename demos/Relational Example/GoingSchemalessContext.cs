#nullable disable

using Microsoft.EntityFrameworkCore;
using TaleLearnCode.GoingSchemaless.Repository.Models;

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

	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Content>(entity =>
		{
			entity.ToTable("Content");

			entity.HasComment("Represents content for an item managed by the platform");

			entity.Property(e => e.ContentId).HasComment("Identifier for the content record.");

			entity.Property(e => e.ContentTypeId).HasComment("Identifier of the type of content being represented.");

			entity.Property(e => e.IsActive)
															.IsRequired()
															.HasDefaultValueSql("((1))")
															.HasComment("Flag indicating whether the content is active.");

			entity.HasOne(d => d.ContentType)
															.WithMany(p => p.Contents)
															.HasForeignKey(d => d.ContentTypeId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkContent_ContentType");
		});

		modelBuilder.Entity<ContentCopy>(entity =>
		{
			entity.ToTable("ContentCopy");

			entity.HasComment("The language/culture-specific version of a content element.");

			entity.Property(e => e.ContentCopyId).HasComment("Identifier for the content copy record.");

			entity.Property(e => e.ContentId).HasComment("Identifier of the content element this language/culture-specific version is for.");

			entity.Property(e => e.CopyText)
															.IsRequired()
															.HasMaxLength(2000)
															.HasComment("Copy for the language/culture-specific version of the content element.");

			entity.Property(e => e.IsActive)
															.IsRequired()
															.HasDefaultValueSql("((1))")
															.HasComment("Flag indicating whether the content copy is active or not.");

			entity.Property(e => e.LanguageCultureId)
															.IsRequired()
															.HasMaxLength(15)
															.IsUnicode(false)
															.HasComment("Identifier of the language/culture used by the content copy.");

			entity.HasOne(d => d.Content)
															.WithMany(p => p.ContentCopies)
															.HasForeignKey(d => d.ContentId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkContentCopy_Content");

			entity.HasOne(d => d.LanguageCulture)
															.WithMany(p => p.ContentCopies)
															.HasForeignKey(d => d.LanguageCultureId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkContentCopy_LanguageCulture");
		});

		modelBuilder.Entity<ContentType>(entity =>
		{
			entity.ToTable("ContentType");

			entity.HasComment("Supported content types for the platform.");

			entity.Property(e => e.ContentTypeId)
															.ValueGeneratedNever()
															.HasComment("Identifier for the content type.");

			entity.Property(e => e.ContentTypeName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("Name of the content type.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the content type is actively supported.");
		});

		modelBuilder.Entity<Country>(entity =>
		{
			entity.HasKey(e => e.CountryCode)
															.HasName("pkcCountry");

			entity.ToTable("Country");

			entity.HasComment("Lookup table representing the countries as defined by the ISO 3166-1 standard.");

			entity.HasIndex(e => e.WorldRegionCode, "idxCountry_WorldRegionCode");

			entity.HasIndex(e => e.WorldSubregionCode, "idxCountry_WorldSubregionCode");

			entity.Property(e => e.CountryCode)
															.HasMaxLength(2)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the country using the ISO 3166-1 Alpha-2 code.");

			entity.Property(e => e.CountryName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("Name of the country using the ISO 3166-1 Country Name.");

			entity.Property(e => e.DivisionName)
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("The primary name of the country's divisions.");

			entity.Property(e => e.HasDivisions).HasComment("Flag indicating whether the country has divisions (states, provinces, etc.).");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the country record is active.");

			entity.Property(e => e.WorldRegionCode)
															.IsRequired()
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the world region where the country is located.");

			entity.Property(e => e.WorldSubregionCode)
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the world subregion where the country is located.");

			entity.HasOne(d => d.WorldRegionCodeNavigation)
															.WithMany(p => p.CountryWorldRegionCodeNavigations)
															.HasForeignKey(d => d.WorldRegionCode)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCountry_WorldRegion");

			entity.HasOne(d => d.WorldSubregionCodeNavigation)
															.WithMany(p => p.CountryWorldSubregionCodeNavigations)
															.HasForeignKey(d => d.WorldSubregionCode)
															.HasConstraintName("fkCountry_WorldSubregion");
		});

		modelBuilder.Entity<CountryDivision>(entity =>
		{
			entity.HasKey(e => new { e.CountryCode, e.CountryDivisionCode })
															.HasName("pkcCountryDivision");

			entity.ToTable("CountryDivision");

			entity.HasComment("Lookup table representing the world regions as defined by the ISO 3166-2 standard.");

			entity.Property(e => e.CountryCode)
															.HasMaxLength(2)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the country using the ISO 3166-1 Alpha-2 code.");

			entity.Property(e => e.CountryDivisionCode)
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the country division using the ISO 3166-2 Alpha-2 code.");

			entity.Property(e => e.CategoryName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("The category name of the country division.");

			entity.Property(e => e.CountryDivisionName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("Name of the country using the ISO 3166-2 Subdivision Name.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the country division record is active.");

			entity.HasOne(d => d.CountryCodeNavigation)
															.WithMany(p => p.CountryDivisions)
															.HasForeignKey(d => d.CountryCode)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCountryDivision_Country");
		});

		modelBuilder.Entity<Currency>(entity =>
		{
			entity.HasKey(e => e.CurrencyCode)
															.HasName("pkcCurrency");

			entity.ToTable("Currency");

			entity.HasComment("Lookup table representing the world currencies as defined by the ISO 4217 standard.");

			entity.Property(e => e.CurrencyCode)
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the currency using the ISO 4217 Code field.");

			entity.Property(e => e.CurrencyName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("The standard name for the currency per the ISO 4217 standard.");

			entity.Property(e => e.CurrencyNumber)
															.IsRequired()
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the currency using the ISO 4217 Num field.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the currency is active.");
		});

		modelBuilder.Entity<CurrencyCountry>(entity =>
		{
			entity.ToTable("CurrencyCountry");

			entity.HasComment("Linking of currency to country where currency is used.");

			entity.Property(e => e.CurrencyCountryId)
															.ValueGeneratedNever()
															.HasComment("Identifier for the currency country record.");

			entity.Property(e => e.CountryCode)
															.IsRequired()
															.HasMaxLength(2)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the referenced country.");

			entity.Property(e => e.CurrencyCode)
															.IsRequired()
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the referenced currency.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the currency/country link is active.");

			entity.HasOne(d => d.CountryCodeNavigation)
															.WithMany(p => p.CurrencyCountries)
															.HasForeignKey(d => d.CountryCode)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCurrencyCountry_Country");

			entity.HasOne(d => d.CurrencyCodeNavigation)
															.WithMany(p => p.CurrencyCountries)
															.HasForeignKey(d => d.CurrencyCode)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCurrencyCountry_Currency");
		});

		modelBuilder.Entity<Customer>(entity =>
		{
			entity.ToTable("Customer");

			entity.HasComment("Represents a customer of the Buliding Bricks ecommerce platform.");

			entity.Property(e => e.CustomerId).HasComment("Identifier for the customer record.");

			entity.Property(e => e.EmailAddress)
															.IsRequired()
															.HasMaxLength(255)
															.IsUnicode(false)
															.HasComment("The email address for the customer.");

			entity.Property(e => e.FirstName)
															.HasMaxLength(100)
															.HasComment("The first name for the customer.");

			entity.Property(e => e.LastName)
															.IsRequired()
															.HasMaxLength(100)
															.HasComment("The last name for the customer.");
		});

		modelBuilder.Entity<CustomerAddress>(entity =>
		{
			entity.ToTable("CustomerAddress");

			entity.HasComment("Represents an address for a Building Bricks customer.");

			entity.Property(e => e.CustomerAddressId).HasComment("Identifier for the customer address record.");

			entity.Property(e => e.AddressLine1)
															.IsRequired()
															.HasMaxLength(100)
															.HasComment("The first line of the street address.");

			entity.Property(e => e.AddressLine2)
															.HasMaxLength(100)
															.HasComment("The second line of the street address.");

			entity.Property(e => e.City)
															.IsRequired()
															.HasMaxLength(100)
															.HasComment("The city where the customer address is located.");

			entity.Property(e => e.CountryCode)
															.IsRequired()
															.HasMaxLength(2)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("The code of the country where the customer address is located.");

			entity.Property(e => e.CountryDivisionCode)
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("The code of the country division where the customer address is located.");

			entity.Property(e => e.CustomerId).HasComment("Identifier for the customer the associated record.");

			entity.Property(e => e.FullName)
															.IsRequired()
															.HasMaxLength(200)
															.HasComment("The full name of the address recipient.");

			entity.Property(e => e.IsDefaultAddress).HasComment("Indication whether the address is the default for the customer.");

			entity.Property(e => e.PhoneNumber)
															.IsRequired()
															.HasMaxLength(20)
															.IsUnicode(false)
															.HasComment("The phone number to use to assist with delivery.");

			entity.Property(e => e.PostalCode)
															.HasMaxLength(20)
															.IsUnicode(false)
															.HasComment("The postal code for the customer address.");

			entity.HasOne(d => d.CountryCodeNavigation)
															.WithMany(p => p.CustomerAddresses)
															.HasForeignKey(d => d.CountryCode)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerAddress_Country");

			entity.HasOne(d => d.Customer)
															.WithMany(p => p.CustomerAddresses)
															.HasForeignKey(d => d.CustomerId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerAddress_Customer");

			entity.HasOne(d => d.Country)
															.WithMany(p => p.CustomerAddresses)
															.HasForeignKey(d => new { d.CountryCode, d.CountryDivisionCode })
															.HasConstraintName("fkCustomerAddress_CountryDivision");
		});

		modelBuilder.Entity<CustomerOrder>(entity =>
		{
			entity.ToTable("CustomerOrder");

			entity.HasComment("Represents customer orders within the ecommerce platform.");

			entity.Property(e => e.CustomerOrderId)
															.HasMaxLength(36)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the customer order record.");

			entity.Property(e => e.CompleteDateTime).HasComment("The UTC date/time the customer order was completed.");

			entity.Property(e => e.CustomerAddressId).HasComment("Identifier of the associated customer address.");

			entity.Property(e => e.CustomerId).HasComment("Identifier of the associated customer order.");

			entity.Property(e => e.OrderDateTime)
															.HasDefaultValueSql("(getutcdate())")
															.HasComment("The UTC date/time the customer order was placed.");

			entity.Property(e => e.OrderStatusId)
															.HasDefaultValueSql("((1))")
															.HasComment("Identifier of the associated order status.");

			entity.Property(e => e.ReserveDateTime).HasComment("The UTC date/time inventory was reserved for the customer order.");

			entity.Property(e => e.ShipDateTime).HasComment("The UTC date/time the customer order was shipped.");

			entity.HasOne(d => d.CustomerAddress)
															.WithMany(p => p.CustomerOrders)
															.HasForeignKey(d => d.CustomerAddressId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrder_CustomerAddress");

			entity.HasOne(d => d.Customer)
															.WithMany(p => p.CustomerOrders)
															.HasForeignKey(d => d.CustomerId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrder_Customer");

			entity.HasOne(d => d.OrderStatus)
															.WithMany(p => p.CustomerOrders)
															.HasForeignKey(d => d.OrderStatusId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrder_OrderStatus");
		});

		modelBuilder.Entity<CustomerOrderItem>(entity =>
		{
			entity.ToTable("CustomerOrderItem");

			entity.HasComment("Represents an item within a customer order.");

			entity.Property(e => e.CustomerOrderItemId).HasComment("Identifier of the customer order item record.");

			entity.Property(e => e.CustomerOrderId)
															.IsRequired()
															.HasMaxLength(36)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the associated customer order record.");

			entity.Property(e => e.DateTimeAdded)
															.HasDefaultValueSql("(getutcdate())")
															.HasComment("The UTC date/time the item was added to the product.");

			entity.Property(e => e.DateTimeModified).HasComment("The UTC date/time the item was modified.");

			entity.Property(e => e.OrderItemStatusId)
															.HasDefaultValueSql("((1))")
															.HasComment("Identifier of the associated order item status.");

			entity.Property(e => e.ProductId)
															.IsRequired()
															.HasMaxLength(5)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the product being ordered.");

			entity.Property(e => e.Quantity).HasComment("The quantity of producting being ordered.");

			entity.HasOne(d => d.CustomerOrder)
															.WithMany(p => p.CustomerOrderItems)
															.HasForeignKey(d => d.CustomerOrderId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrderItem_CustomerOrder");

			entity.HasOne(d => d.OrderItemStatus)
															.WithMany(p => p.CustomerOrderItems)
															.HasForeignKey(d => d.OrderItemStatusId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrderItem_OrderStatus");

			entity.HasOne(d => d.Product)
															.WithMany(p => p.CustomerOrderItems)
															.HasForeignKey(d => d.ProductId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrderItem_Product");
		});

		modelBuilder.Entity<Language>(entity =>
		{
			entity.HasKey(e => e.LanguageCode)
															.HasName("pkcLanguage");

			entity.ToTable("Language");

			entity.HasComment("Represents a spoken/written language.");

			entity.Property(e => e.LanguageCode)
															.HasMaxLength(2)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the language.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the language is active.");

			entity.Property(e => e.LanguageName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("Name of the language.");

			entity.Property(e => e.NativeName)
															.IsRequired()
															.HasMaxLength(100)
															.HasComment("Native name of the language.");
		});

		modelBuilder.Entity<LanguageCulture>(entity =>
		{
			entity.ToTable("LanguageCulture");

			entity.HasComment("Represents a language with culture differences that is spoken/written.");

			entity.Property(e => e.LanguageCultureId)
															.HasMaxLength(15)
															.IsUnicode(false)
															.HasComment("Identifier of the language culture record.");

			entity.Property(e => e.EnglishName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("The English name of the language culture.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the language culture is active.");

			entity.Property(e => e.LanguageCode)
															.IsRequired()
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Code for the associated language.");

			entity.Property(e => e.NativeName)
															.IsRequired()
															.HasMaxLength(100)
															.HasComment("The native name of the language culture.");
		});

		modelBuilder.Entity<OrderStatus>(entity =>
		{
			entity.ToTable("OrderStatus");

			entity.HasComment("Represents the status of a customer order.");

			entity.Property(e => e.OrderStatusId)
															.ValueGeneratedNever()
															.HasComment("Identifier of the customer order status record.");

			entity.Property(e => e.OrderStatusName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("The name of the customer order status.");
		});

		modelBuilder.Entity<Product>(entity =>
		{
			entity.ToTable("Product");

			entity.HasComment("Represents a product sold by Building Bricks.");

			entity.Property(e => e.ProductId)
															.HasMaxLength(5)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("The identifier of the product record.");

			entity.Property(e => e.DescriptionId).HasComment("Identifier of the content element representing the description of the product.");

			entity.Property(e => e.HardToFind).HasComment("Flag indicating whether the product is hard to find in retail stores.");

			entity.Property(e => e.IsActive)
															.IsRequired()
															.HasDefaultValueSql("((1))")
															.HasComment("Flag indicating whether the product record is active (not soft-deleted).");

			entity.Property(e => e.LocalizedNameId).HasComment("Identifier of the content element representing the localized name of the product.");

			entity.Property(e => e.LoyalityPoints).HasComment("The number of loyality points awarded to purchasers of the product.");

			entity.Property(e => e.PieceCount).HasComment("The number of pieces in the product.");

			entity.Property(e => e.ProductAvailabilityId).HasComment("Identifier of the product's current availability online.");

			entity.Property(e => e.ProductName)
															.IsRequired()
															.HasMaxLength(100)
															.HasComment("The name of the product.");

			entity.Property(e => e.ShippingWeight).HasComment("The shipping weight for the product.");

			entity.Property(e => e.YearReleased).HasComment("The year the product was released.");

			entity.HasOne(d => d.Description)
															.WithMany(p => p.ProductDescriptions)
															.HasForeignKey(d => d.DescriptionId)
															.HasConstraintName("fkProduct_Content_Description");

			entity.HasOne(d => d.LocalizedName)
															.WithMany(p => p.ProductLocalizedNames)
															.HasForeignKey(d => d.LocalizedNameId)
															.HasConstraintName("fkProduct_Content_LocalizedName");

			entity.HasOne(d => d.ProductAvailability)
															.WithMany(p => p.Products)
															.HasForeignKey(d => d.ProductAvailabilityId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkProduct_ProductAvailability");
		});

		modelBuilder.Entity<ProductAvailability>(entity =>
		{
			entity.ToTable("ProductAvailability");

			entity.HasComment("The current availability of a product.");

			entity.Property(e => e.ProductAvailabilityId)
															.ValueGeneratedNever()
															.HasComment("The identifier of the product availability record.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the product availability is active.");

			entity.Property(e => e.ProductAvailabilityName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("The name of the product availability.");

			entity.Property(e => e.SortOrder).HasComment("The sorting order of the product availability.");
		});

		modelBuilder.Entity<ProductPrice>(entity =>
		{
			entity.ToTable("ProductPrice");

			entity.HasComment("Represents the currency-specific pricing for a product.");

			entity.Property(e => e.ProductPriceId).HasComment("The identifier of the product pricing record.");

			entity.Property(e => e.CurrencyCode)
															.IsRequired()
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the referenced currency.");

			entity.Property(e => e.Price)
															.HasColumnType("smallmoney")
															.HasComment("The price of the referenced product in the referenced currency.");

			entity.Property(e => e.ProductId)
															.IsRequired()
															.HasMaxLength(5)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the referenced product.");

			entity.HasOne(d => d.CurrencyCodeNavigation)
															.WithMany(p => p.ProductPrices)
															.HasForeignKey(d => d.CurrencyCode)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkProductPrice_Currency");

			entity.HasOne(d => d.Product)
															.WithMany(p => p.ProductPrices)
															.HasForeignKey(d => d.ProductId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkProductPrice_Product");
		});

		modelBuilder.Entity<ProductTheme>(entity =>
		{
			entity.ToTable("ProductTheme");

			entity.HasComment("Links a product to a marketing theme.");

			entity.Property(e => e.ProductThemeId).HasComment("The identifier of the product theme record.");

			entity.Property(e => e.ProductId)
															.IsRequired()
															.HasMaxLength(5)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the referenced product.");

			entity.Property(e => e.SortOrder).HasComment("The sorting order of the product within the theme.");

			entity.Property(e => e.ThemeId).HasComment("Identifier of the referenced theme.");

			entity.HasOne(d => d.Product)
															.WithMany(p => p.ProductThemes)
															.HasForeignKey(d => d.ProductId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkProductTheme_Product");

			entity.HasOne(d => d.Theme)
															.WithMany(p => p.ProductThemes)
															.HasForeignKey(d => d.ThemeId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkProductTheme_Theme");
		});

		modelBuilder.Entity<Theme>(entity =>
		{
			entity.ToTable("Theme");

			entity.HasComment("Represents a theme within the products for classification and marketing purposes.");

			entity.Property(e => e.ThemeId).HasComment("The identifier of the theme record.");

			entity.Property(e => e.DescriptionId).HasComment("Identifier of the content that represents the description of the product theme.");

			entity.Property(e => e.IsActive)
															.IsRequired()
															.HasDefaultValueSql("((1))");

			entity.Property(e => e.LocalizedNameId).HasComment("Identifier of the content that represents the localized name of the product theme.");

			entity.Property(e => e.ThemeName)
															.IsRequired()
															.HasMaxLength(100)
															.HasComment("The name of the theme.");

			entity.HasOne(d => d.Description)
															.WithMany(p => p.ThemeDescriptions)
															.HasForeignKey(d => d.DescriptionId)
															.HasConstraintName("fkTheme_Content_Description");

			entity.HasOne(d => d.LocalizedName)
															.WithMany(p => p.ThemeLocalizedNames)
															.HasForeignKey(d => d.LocalizedNameId)
															.HasConstraintName("fkTheme_Content_LocalizedName");
		});

		modelBuilder.Entity<WorldRegion>(entity =>
		{
			entity.HasKey(e => e.WorldRegionCode)
															.HasName("pkcWorldRegion");

			entity.ToTable("WorldRegion");

			entity.HasComment("Represents a spoken/written language.");

			entity.HasIndex(e => e.ParentCode, "idxWorldRegion_ParentCode");

			entity.Property(e => e.WorldRegionCode)
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the world region as defeined the UN M49 specification.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the world region is active.");

			entity.Property(e => e.ParentCode)
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the world region parent (for subregions).");

			entity.Property(e => e.WorldRegionName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("Name of the world region as defeined the UN M49 specification.");

			entity.HasOne(d => d.ParentCodeNavigation)
															.WithMany(p => p.InverseParentCodeNavigation)
															.HasForeignKey(d => d.ParentCode)
															.HasConstraintName("fkWorldRegion_WorldRegion");
		});

	}

}