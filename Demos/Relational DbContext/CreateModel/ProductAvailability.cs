namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void ProductAvailability(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<ProductAvailability>(entity =>
		{
			entity.ToTable("ProductAvailability", t => t.HasComment("The current availability of a product."));

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
	}
}