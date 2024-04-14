namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class CountryDivisionComponent : ComponentBase
{


	[JsonProperty("code")]
	public string Code { get; set; } = null!;

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

	[JsonProperty("categoryName")]
	public string CategoryName { get; set; } = null!;

}