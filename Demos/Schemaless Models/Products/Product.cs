namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class Product : ModelBase
{

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

	[JsonProperty("yearReleased")]
	public int? YearReleased { get; set; }

	[JsonProperty("shippingWeight")]
	public int? ShippingWeight { get; set; }

	[JsonProperty("pieceCount")]
	public int? PieceCount { get; set; }

	[JsonProperty("loyaltyPoints")]
	public int? LoyaltyPoints { get; set; }

	[JsonProperty("productAvailabilityId")]
	public string ProductAvailability { get; set; } = null!;

	[JsonProperty("productAvailability")]
	public string Availability { get; set; } = null!;

	[JsonProperty("hardToFind")]
	public bool HardToFind { get; set; }

	[JsonProperty("localizedName")]
	public Dictionary<string, string>? LocalizedName { get; set; }

	[JsonProperty("description")]
	public Dictionary<string, string>? Description { get; set; }

	[JsonProperty("prices")]
	public Dictionary<string, decimal>? Prices { get; set; }

	[JsonProperty("themes")]
	public List<ThemeComponent>? Themes { get; set; }

}