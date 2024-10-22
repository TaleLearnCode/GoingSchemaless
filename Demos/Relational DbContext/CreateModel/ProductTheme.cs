namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void ProductTheme(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<ProductTheme>(entity =>
		{
			entity.ToTable("ProductTheme", t => t.HasComment("Links a product to a marketing theme."));

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
	}
}