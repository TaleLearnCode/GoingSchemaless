namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void Theme(ModelBuilder modelBuilder)
	{
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
	}
}