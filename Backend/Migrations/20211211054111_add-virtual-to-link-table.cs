using Microsoft.EntityFrameworkCore.Migrations;

namespace InternshippClass.Migrations
{
    public partial class addvirtualtolinktable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UsersToVocationalGroups_Users_UserId1",
                table: "UsersToVocationalGroups");

            migrationBuilder.DropForeignKey(
                name: "FK_UsersToVocationalGroups_VocationalGroups_VocationalGroupId",
                table: "UsersToVocationalGroups");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UsersToVocationalGroups",
                table: "UsersToVocationalGroups");

            migrationBuilder.RenameTable(
                name: "UsersToVocationalGroups",
                newName: "UserToVocationalGroups");

            migrationBuilder.RenameIndex(
                name: "IX_UsersToVocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups",
                newName: "IX_UserToVocationalGroups_VocationalGroupId");

            migrationBuilder.RenameIndex(
                name: "IX_UsersToVocationalGroups_UserId1",
                table: "UserToVocationalGroups",
                newName: "IX_UserToVocationalGroups_UserId1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserToVocationalGroups",
                table: "UserToVocationalGroups",
                column: "Id");

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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_Users_UserId1",
                table: "UserToVocationalGroups");

            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_VocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserToVocationalGroups",
                table: "UserToVocationalGroups");

            migrationBuilder.RenameTable(
                name: "UserToVocationalGroups",
                newName: "UsersToVocationalGroups");

            migrationBuilder.RenameIndex(
                name: "IX_UserToVocationalGroups_VocationalGroupId",
                table: "UsersToVocationalGroups",
                newName: "IX_UsersToVocationalGroups_VocationalGroupId");

            migrationBuilder.RenameIndex(
                name: "IX_UserToVocationalGroups_UserId1",
                table: "UsersToVocationalGroups",
                newName: "IX_UsersToVocationalGroups_UserId1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UsersToVocationalGroups",
                table: "UsersToVocationalGroups",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UsersToVocationalGroups_Users_UserId1",
                table: "UsersToVocationalGroups",
                column: "UserId1",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_UsersToVocationalGroups_VocationalGroups_VocationalGroupId",
                table: "UsersToVocationalGroups",
                column: "VocationalGroupId",
                principalTable: "VocationalGroups",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
