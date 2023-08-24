namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class CustomerOrderItemDetail
{

	[JsonProperty("legacyId")]
	public int? LegacyId { get; set; }

	[JsonProperty("productId")]
	public string ProductId { get; set; } = null!;

	[JsonProperty("productName")]
	public string ProductName { get; set; } = null!;

	[JsonProperty("quantity")]
	public int Quantity { get; set; }

	[JsonProperty("unitPrice")]
	public decimal UnitPrice { get; set; }

	[JsonProperty("dateTimeAdded")]
	public DateTime DateTimeAdded { get; set; }

	[JsonProperty("dateTimeModified")]
	public DateTime DateTimeModified { get; set; }

}