namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class Country : MetadataBase
{

	[JsonProperty("code")]
	public string Code { get; set; } = null!;

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

	[JsonProperty("worldRegion")]
	public WorldRegionComponent? WorldRegion { get; set; }

	[JsonProperty("worldSubregion")]
	public WorldRegionComponent? WorldSubregion { get; set; }

	[JsonProperty("hasDivisions")]
	public bool HasDivisions { get; set; }

	[JsonProperty("divisionName")]
	public string? DivisionName { get; set; }

	[JsonProperty("countryDivisions")]
	public List<CountryDivisionComponent> CountryDivisions { get; set; } = new();

}