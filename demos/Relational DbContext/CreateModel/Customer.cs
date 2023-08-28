namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void Customer(ModelBuilder modelBuilder)
	{
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
	}
}