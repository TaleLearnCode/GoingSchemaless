#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents a spoken/written language.
/// </summary>
public partial class WorldRegion
{

	public WorldRegion()
	{
		CountryWorldRegionCodeNavigations = new HashSet<Country>();
		CountryWorldSubregionCodeNavigations = new HashSet<Country>();
		InverseParentCodeNavigation = new HashSet<WorldRegion>();
	}

	/// <summary>
	/// Identifier of the world region as defeined the UN M49 specification.
	/// </summary>
	public string WorldRegionCode { get; set; }
	/// <summary>
	/// Name of the world region as defeined the UN M49 specification.
	/// </summary>
	public string WorldRegionName { get; set; }
	/// <summary>
	/// Identifier of the world region parent (for subregions).
	/// </summary>
	public string ParentCode { get; set; }
	/// <summary>
	/// Flag indicating whether the world region is active.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual WorldRegion ParentCodeNavigation { get; set; }
	public virtual ICollection<Country> CountryWorldRegionCodeNavigations { get; set; }
	public virtual ICollection<Country> CountryWorldSubregionCodeNavigations { get; set; }
	public virtual ICollection<WorldRegion> InverseParentCodeNavigation { get; set; }

}