namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{

	internal static void Content(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Content>(entity =>
		{
			entity.ToTable("Content");

			entity.HasComment("Represents content for an item managed by the platform");

			entity.Property(e => e.ContentId).HasComment("Identifier for the content record.");

			entity.Property(e => e.ContentTypeId).HasComment("Identifier of the type of content being represented.");

			entity.Property(e => e.IsActive)
															.IsRequired()
															.HasDefaultValueSql("((1))")
															.HasComment("Flag indicating whether the content is active.");

			entity.HasOne(d => d.ContentType)
															.WithMany(p => p.Contents)
															.HasForeignKey(d => d.ContentTypeId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkContent_ContentType");
		});
	}

}