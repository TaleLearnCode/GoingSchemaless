namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void ProductPrice(ModelBuilder modelBuilder)
	{
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
	}
}