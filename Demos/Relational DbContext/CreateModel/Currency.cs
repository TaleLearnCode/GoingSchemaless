namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void Currency(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Currency>(entity =>
		{
			entity.HasKey(e => e.CurrencyCode)
															.HasName("pkcCurrency");

			entity.ToTable("Currency", t => t.HasComment("Lookup table representing the world currencies as defined by the ISO 4217 standard."));

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
	}
}
