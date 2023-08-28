namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class CustomerAddressComponent
{

	[JsonProperty("legacyId")]
	public int? LegacyId { get; set; }

	[JsonProperty("fullName")]
	public string FullName { get; set; } = null!;

	[JsonProperty("phoneNumber")]
	public string PhoneNumber { get; set; } = null!;

	[JsonProperty("addressLine1")]
	public string AddressLine1 { get; set; } = null!;

	[JsonProperty("addressLine2")]
	public string? AddressLine2 { get; set; }

	[JsonProperty("city")]
	public string City { get; set; } = null!;

	[JsonProperty("country")]
	public CountryComponent Country { get; set; } = null!;

	[JsonProperty("countryDivision")]
	public CountryDivisionComponent? CountryDivision { get; set; }

	[JsonProperty("postalCode")]
	public string? PostalCode { get; set; }

	[JsonProperty("isDefault")]
	public bool IsDefault { get; set; }

}