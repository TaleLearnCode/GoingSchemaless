namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void OrderStatus(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<OrderStatus>(entity =>
		{
			entity.ToTable("OrderStatus");

			entity.HasComment("Represents the status of a customer order.");

			entity.Property(e => e.OrderStatusId)
															.ValueGeneratedNever()
															.HasComment("Identifier of the customer order status record.");

			entity.Property(e => e.OrderStatusName)
															.IsRequired()
															.HasMaxLength(100)
															.IsUnicode(false)
															.HasComment("The name of the customer order status.");
		});
	}
}