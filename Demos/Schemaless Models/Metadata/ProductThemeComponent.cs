namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class ProductThemeComponent : ComponentBase
{

	[JsonProperty("legacyId")]
	public int? LegacyId { get; set; }

	[JsonProperty("productId")]
	public string ProductId { get; set; } = null!;

	[JsonProperty("name")]
	public Dictionary<string, string>? Name { get; set; }

	[JsonProperty("pieceCount")]
	public int? PieceCount { get; set; }

	[JsonProperty("productAvailabilityId")]
	public string ProductAvailability { get; set; } = null!;

	[JsonProperty("productAvailability")]
	public string Availability { get; set; } = null!;

	[JsonProperty("hardToFind")]
	public bool HardToFind { get; set; }

}