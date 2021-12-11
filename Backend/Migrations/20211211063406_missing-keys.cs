using Microsoft.EntityFrameworkCore.Migrations;

namespace InternshippClass.Migrations
{
    public partial class missingkeys : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PermissionsToRoles_Permissions_PermissionId",
                table: "PermissionsToRoles");

            migrationBuilder.DropForeignKey(
                name: "FK_PermissionsToRoles_Roles_RoleId",
                table: "PermissionsToRoles");

            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_Users_UserId",
                table: "UserToVocationalGroups");

            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_VocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups");

            migrationBuilder.AlterColumn<long>(
                name: "VocationalGroupId",
                table: "UserToVocationalGroups",
                type: "bigint",
                nullable: false,
                defaultValue: 0L,
                oldClrType: typeof(long),
                oldType: "bigint",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "UserToVocationalGroups",
                type: "integer",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "integer",
                oldNullable: true);

            migrationBuilder.AlterColumn<long>(
                name: "RoleId",
                table: "PermissionsToRoles",
                type: "bigint",
                nullable: false,
                defaultValue: 0L,
                oldClrType: typeof(long),
                oldType: "bigint",
                oldNullable: true);

            migrationBuilder.AlterColumn<long>(
                name: "PermissionId",
                table: "PermissionsToRoles",
                type: "bigint",
                nullable: false,
                defaultValue: 0L,
                oldClrType: typeof(long),
                oldType: "bigint",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_PermissionsToRoles_Permissions_PermissionId",
                table: "PermissionsToRoles",
                column: "PermissionId",
                principalTable: "Permissions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PermissionsToRoles_Roles_RoleId",
                table: "PermissionsToRoles",
                column: "RoleId",
                principalTable: "Roles",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UserToVocationalGroups_Users_UserId",
                table: "UserToVocationalGroups",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

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
                name: "FK_PermissionsToRoles_Permissions_PermissionId",
                table: "PermissionsToRoles");

            migrationBuilder.DropForeignKey(
                name: "FK_PermissionsToRoles_Roles_RoleId",
                table: "PermissionsToRoles");

            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_Users_UserId",
                table: "UserToVocationalGroups");

            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_VocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups");

            migrationBuilder.AlterColumn<long>(
                name: "VocationalGroupId",
                table: "UserToVocationalGroups",
                type: "bigint",
                nullable: true,
                oldClrType: typeof(long),
                oldType: "bigint");

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "UserToVocationalGroups",
                type: "integer",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "integer");

            migrationBuilder.AlterColumn<long>(
                name: "RoleId",
                table: "PermissionsToRoles",
                type: "bigint",
                nullable: true,
                oldClrType: typeof(long),
                oldType: "bigint");

            migrationBuilder.AlterColumn<long>(
                name: "PermissionId",
                table: "PermissionsToRoles",
                type: "bigint",
                nullable: true,
                oldClrType: typeof(long),
                oldType: "bigint");

            migrationBuilder.AddForeignKey(
                name: "FK_PermissionsToRoles_Permissions_PermissionId",
                table: "PermissionsToRoles",
                column: "PermissionId",
                principalTable: "Permissions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PermissionsToRoles_Roles_RoleId",
                table: "PermissionsToRoles",
                column: "RoleId",
                principalTable: "Roles",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_UserToVocationalGroups_Users_UserId",
                table: "UserToVocationalGroups",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_UserToVocationalGroups_VocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups",
                column: "VocationalGroupId",
                principalTable: "VocationalGroups",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
