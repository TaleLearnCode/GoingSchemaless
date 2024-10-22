namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void WorldRegion(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<WorldRegion>(entity =>
		{
			entity.HasKey(e => e.WorldRegionCode)
															.HasName("pkcWorldRegion");

			entity.ToTable("WorldRegion", t => t.HasComment("Represents a spoken/written language."));

			entity.HasIndex(e => e.ParentCode, "idxWorldRegion_ParentCode");

			entity.Property(e => e.WorldRegionCode)
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the world region as defeined the UN M49 specification.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the world region is active.");

			entity.Property(e => e.ParentCode)
															.HasMaxLength(3)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the world region parent (for subregions).");

			entity.Property(e => e.WorldRegionName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("Name of the world region as defeined the UN M49 specification.");

			entity.HasOne(d => d.ParentCodeNavigation)
															.WithMany(p => p.InverseParentCodeNavigation)
															.HasForeignKey(d => d.ParentCode)
															.HasConstraintName("fkWorldRegion_WorldRegion");
		});
	}
}