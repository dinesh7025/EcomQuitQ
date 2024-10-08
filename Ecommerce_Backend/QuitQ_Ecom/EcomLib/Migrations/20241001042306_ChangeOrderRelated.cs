using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EcomLib.Migrations
{
    /// <inheritdoc />
    public partial class ChangeOrderRelated : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // Drop the foreign key for ProductId (if it exists)
            migrationBuilder.DropForeignKey(
                name: "FK_OrderItems_Products_ProductId",
                table: "OrderItems");

            // Add the new UserId column
            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "OrderItems",
                type: "int",
                nullable: true);

            // Create the index for UserId
            migrationBuilder.CreateIndex(
                name: "IX_OrderItems_UserId",
                table: "OrderItems",
                column: "UserId");

            // Re-add foreign key for ProductId
            migrationBuilder.AddForeignKey(
                name: "FK_OrderItems_Products_ProductId",
                table: "OrderItems",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "ProductId",
                onDelete: ReferentialAction.Restrict);

            // Add foreign key for UserId (new relationship)
            migrationBuilder.AddForeignKey(
                name: "FK_OrderItems_Users_UserId",
                table: "OrderItems",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "UserId",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            // Drop foreign key for ProductId
            migrationBuilder.DropForeignKey(
                name: "FK_OrderItems_Products_ProductId",
                table: "OrderItems");

            // Drop foreign key for UserId
            migrationBuilder.DropForeignKey(
                name: "FK_OrderItems_Users_UserId",
                table: "OrderItems");

            // Drop index for UserId
            migrationBuilder.DropIndex(
                name: "IX_OrderItems_UserId",
                table: "OrderItems");

            // Drop the UserId column
            migrationBuilder.DropColumn(
                name: "UserId",
                table: "OrderItems");

            // Re-add the foreign key for ProductId with Cascade delete (if originally defined this way)
            migrationBuilder.AddForeignKey(
                name: "FK_OrderItems_Products_ProductId",
                table: "OrderItems",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "ProductId",
                onDelete: ReferentialAction.Cascade);
        }
    }

}
