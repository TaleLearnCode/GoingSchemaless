#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents an address for a Building Bricks customer.
/// </summary>
public partial class CustomerAddress
{

	public CustomerAddress()
	{
		CustomerOrders = new HashSet<CustomerOrder>();
	}

	/// <summary>
	/// Identifier for the customer address record.
	/// </summary>
	public int CustomerAddressId { get; set; }
	/// <summary>
	/// Identifier for the customer the associated record.
	/// </summary>
	public int CustomerId { get; set; }
	/// <summary>
	/// The full name of the address recipient.
	/// </summary>
	public string FullName { get; set; }
	/// <summary>
	/// The phone number to use to assist with delivery.
	/// </summary>
	public string PhoneNumber { get; set; }
	/// <summary>
	/// The first line of the street address.
	/// </summary>
	public string AddressLine1 { get; set; }
	/// <summary>
	/// The second line of the street address.
	/// </summary>
	public string AddressLine2 { get; set; }
	/// <summary>
	/// The city where the customer address is located.
	/// </summary>
	public string City { get; set; }
	/// <summary>
	/// The code of the country where the customer address is located.
	/// </summary>
	public string CountryCode { get; set; }
	/// <summary>
	/// The code of the country division where the customer address is located.
	/// </summary>
	public string CountryDivisionCode { get; set; }
	/// <summary>
	/// The postal code for the customer address.
	/// </summary>
	public string PostalCode { get; set; }
	/// <summary>
	/// Indication whether the address is the default for the customer.
	/// </summary>
	public bool IsDefaultAddress { get; set; }

	public virtual CountryDivision Country { get; set; }
	public virtual Country CountryCodeNavigation { get; set; }
	public virtual Customer Customer { get; set; }
	public virtual ICollection<CustomerOrder> CustomerOrders { get; set; }

}