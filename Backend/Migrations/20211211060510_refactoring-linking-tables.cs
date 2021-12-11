using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace InternshippClass.Migrations
{
    public partial class refactoringlinkingtables : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Permissions_Roles_RoleId",
                table: "Permissions");

            migrationBuilder.DropIndex(
                name: "IX_Permissions_RoleId",
                table: "Permissions");

            migrationBuilder.DropColumn(
                name: "RoleId",
                table: "Permissions");

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
                oldClrType: typeof(long),
                oldType: "bigint");

            migrationBuilder.CreateTable(
                name: "PermissionsToRoles",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    PermissionId = table.Column<long>(type: "bigint", nullable: true),
                    RoleId = table.Column<long>(type: "bigint", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PermissionsToRoles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PermissionsToRoles_Permissions_PermissionId",
                        column: x => x.PermissionId,
                        principalTable: "Permissions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PermissionsToRoles_Roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserToVocationalGroups_UserId",
                table: "UserToVocationalGroups",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserToVocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups",
                column: "VocationalGroupId");

            migrationBuilder.CreateIndex(
                name: "IX_PermissionsToRoles_PermissionId",
                table: "PermissionsToRoles",
                column: "PermissionId");

            migrationBuilder.CreateIndex(
                name: "IX_PermissionsToRoles_RoleId",
                table: "PermissionsToRoles",
                column: "RoleId");

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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_Users_UserId",
                table: "UserToVocationalGroups");

            migrationBuilder.DropForeignKey(
                name: "FK_UserToVocationalGroups_VocationalGroups_VocationalGroupId",
                table: "UserToVocationalGroups");

            migrationBuilder.DropTable(
                name: "PermissionsToRoles");

            migrationBuilder.DropIndex(
                name: "IX_UserToVocationalGroups_UserId",
                table: "UserToVocationalGroups");

            migrationBuilder.DropIndex(
                name: "IX_UserToVocationalGroups_VocationalGroupId",
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

            migrationBuilder.AlterColumn<long>(
                name: "UserId",
                table: "UserToVocationalGroups",
                type: "bigint",
                nullable: false,
                defaultValue: 0L,
                oldClrType: typeof(int),
                oldType: "integer",
                oldNullable: true);

            migrationBuilder.AddColumn<long>(
                name: "RoleId",
                table: "Permissions",
                type: "bigint",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Permissions_RoleId",
                table: "Permissions",
                column: "RoleId");

            migrationBuilder.AddForeignKey(
                name: "FK_Permissions_Roles_RoleId",
                table: "Permissions",
                column: "RoleId",
                principalTable: "Roles",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
