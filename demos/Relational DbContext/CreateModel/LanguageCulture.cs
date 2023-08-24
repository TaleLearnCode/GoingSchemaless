namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void LanguageCulture(ModelBuilder modelBuilder)
	{
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
	}
}