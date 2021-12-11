using Microsoft.EntityFrameworkCore.Migrations;

namespace InternshippClass.Migrations
{
    public partial class tryfixuservgroup : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_Users_UserId1",
                table: "UserToVocationalGroups");

            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_VocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups");

            migrationBuilder.DropIndex(
                name: "IX_UserToVocationalGroups_UserId1",
                table: "UserToVocationalGroups");

            migrationBuilder.DropIndex(
                name: "IX_UserToVocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups");

            migrationBuilder.DropColumn(
                name: "UserId1",
                table: "UserToVocationalGroups");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UserId1",
                table: "UserToVocationalGroups",
                type: "integer",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserToVocationalGroups_UserId1",
                table: "UserToVocationalGroups",
                column: "UserId1");

            migrationBuilder.CreateIndex(
                name: "IX_UserToVocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups",
                column: "VocationalGroupId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserToVocationalGroups_Users_UserId1",
                table: "UserToVocationalGroups",
                column: "UserId1",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_UserToVocationalGroups_VocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups",
                column: "VocationalGroupId",
                principalTable: "VocationalGroups",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
