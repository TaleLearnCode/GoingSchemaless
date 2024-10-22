namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void ContentType(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<ContentType>(entity =>
		{
			entity.ToTable(t => t.HasComment("Supported content types for the platform."));

			entity.Property(e => e.ContentTypeId)
															.ValueGeneratedNever()
															.HasComment("Identifier for the content type.");

			entity.Property(e => e.ContentTypeName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("Name of the content type.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the content type is actively supported.");
		});
	}
}
