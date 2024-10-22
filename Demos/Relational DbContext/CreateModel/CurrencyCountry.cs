namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void CurrencyCountry(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CurrencyCountry>(entity =>
		{
			entity.ToTable("CurrencyCountry", t => t.HasComment("Linking of currency to country where currency is used."));

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
	}
}
