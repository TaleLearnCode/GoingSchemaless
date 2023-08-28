namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void ContentCopy(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<ContentCopy>(entity =>
		{
			entity.ToTable("ContentCopy");

			entity.HasComment("The language/culture-specific version of a content element.");

			entity.Property(e => e.ContentCopyId).HasComment("Identifier for the content copy record.");

			entity.Property(e => e.ContentId).HasComment("Identifier of the content element this language/culture-specific version is for.");

			entity.Property(e => e.CopyText)
															.IsRequired()
															.HasMaxLength(2000)
															.HasComment("Copy for the language/culture-specific version of the content element.");

			entity.Property(e => e.IsActive)
															.IsRequired()
															.HasDefaultValueSql("((1))")
															.HasComment("Flag indicating whether the content copy is active or not.");

			entity.Property(e => e.LanguageCultureId)
															.IsRequired()
															.HasMaxLength(15)
															.IsUnicode(false)
															.HasComment("Identifier of the language/culture used by the content copy.");

			entity.HasOne(d => d.Content)
															.WithMany(p => p.ContentCopies)
															.HasForeignKey(d => d.ContentId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkContentCopy_Content");

			entity.HasOne(d => d.LanguageCulture)
															.WithMany(p => p.ContentCopies)
															.HasForeignKey(d => d.LanguageCultureId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkContentCopy_LanguageCulture");
		});
	}
}