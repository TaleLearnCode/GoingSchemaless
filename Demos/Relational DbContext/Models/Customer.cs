﻿#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents a customer of the Buliding Bricks ecommerce platform.
/// </summary>
public partial class Customer
{

	public Customer()
	{
		CustomerAddresses = new HashSet<CustomerAddress>();
		CustomerOrders = new HashSet<CustomerOrder>();
	}

	/// <summary>
	/// Identifier for the customer record.
	/// </summary>
	public int CustomerId { get; set; }
	/// <summary>
	/// The first name for the customer.
	/// </summary>
	public string FirstName { get; set; }
	/// <summary>
	/// The last name for the customer.
	/// </summary>
	public string LastName { get; set; }
	/// <summary>
	/// The email address for the customer.
	/// </summary>
	public string EmailAddress { get; set; }

	public virtual ICollection<CustomerAddress> CustomerAddresses { get; set; }
	public virtual ICollection<CustomerOrder> CustomerOrders { get; set; }

}