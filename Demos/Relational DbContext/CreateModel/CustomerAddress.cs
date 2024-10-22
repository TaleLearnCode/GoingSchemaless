namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void CustomerAddress(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CustomerAddress>(entity =>
		{
			entity.ToTable("CustomerAddress", t => t.HasComment("Represents an address for a Building Bricks customer."));

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
	}
}
