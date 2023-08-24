namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class CountryDivision : MetadataBase
{

	[JsonProperty("code")]
	public string Code { get; set; } = null!;

	[JsonProperty("countryCode")]
	public string CountryCode { get; set; } = null!;

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

	[JsonProperty("categoryName")]
	public string CategoryName { get; set; } = null!;

	[JsonProperty("country")]
	public CountryComponent Country { get; set; } = null!;

}