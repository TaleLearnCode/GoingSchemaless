namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class CustomerOrderItemComponent : ComponentBase
{

	[JsonProperty("productId")]
	public string ProductId { get; set; } = null!;

	[JsonProperty("productName")]
	public string ProductName { get; set; } = null!;

	[JsonProperty("statusId")]
	public string StatusId { get; set; } = null!;

	[JsonProperty("status")]
	public string Status { get; set; } = null!;

}