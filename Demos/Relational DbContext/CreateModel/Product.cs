namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void Product(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Product>(entity =>
		{

			entity.ToTable("Product", t => t.HasComment("Represents a product sold by Building Bricks."));

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
	}
}
