﻿// <auto-generated />
using System;
using InternshippClass.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace InternshippClass.Migrations
{
    [DbContext(typeof(ProvoloneContext))]
    partial class InternDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 63)
                .HasAnnotation("ProductVersion", "5.0.4")
                .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

            modelBuilder.Entity("InternshippClass.Models.Entities.Discipline", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<long>("FieldId")
                        .HasColumnType("bigint");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("FieldId");

                    b.ToTable("Disciplines");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Field", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Fields");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.GroupToDiscipline", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<long>("DisciplineId")
                        .HasColumnType("bigint");

                    b.Property<long>("VocationalGroupId")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.HasIndex("DisciplineId");

                    b.HasIndex("VocationalGroupId");

                    b.ToTable("GroupsToDisciplines");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Learner", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<int>("Age")
                        .HasColumnType("integer");

                    b.Property<DateTime>("BirthDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Gender")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Institution")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<long>("VocationalGroupId")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.HasIndex("VocationalGroupId");

                    b.ToTable("Learners");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Mark", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<DateTime>("Date")
                        .HasColumnType("timestamp without time zone");

                    b.Property<long>("DisciplineId")
                        .HasColumnType("bigint");

                    b.Property<long>("LearnerId")
                        .HasColumnType("bigint");

                    b.Property<int>("Value")
                        .HasColumnType("integer");

                    b.HasKey("Id");

                    b.HasIndex("DisciplineId");

                    b.HasIndex("LearnerId");

                    b.ToTable("Marks");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Permission", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Permissions");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.PermissionsToRoles", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<long?>("PermissionId")
                        .HasColumnType("bigint");

                    b.Property<long?>("RoleId")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.HasIndex("PermissionId");

                    b.HasIndex("RoleId");

                    b.ToTable("PermissionsToRoles");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Role", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.UserToVocationalGroup", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<int?>("UserId")
                        .HasColumnType("integer");

                    b.Property<long?>("VocationalGroupId")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.HasIndex("VocationalGroupId");

                    b.ToTable("UserToVocationalGroups");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.VocationalGroup", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<long>("UserId")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.ToTable("VocationalGroups");
                });

            modelBuilder.Entity("Provolone.Domains.Entities.User", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<long>("DisciplineId")
                        .HasColumnType("bigint");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Lastname")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<long?>("RoleId")
                        .HasColumnType("bigint");

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("DisciplineId");

                    b.HasIndex("RoleId")
                        .IsUnique();

                    b.ToTable("Users");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Discipline", b =>
                {
                    b.HasOne("InternshippClass.Models.Entities.Field", "Field")
                        .WithMany("Disciplines")
                        .HasForeignKey("FieldId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Field");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.GroupToDiscipline", b =>
                {
                    b.HasOne("InternshippClass.Models.Entities.Discipline", "Discipline")
                        .WithMany()
                        .HasForeignKey("DisciplineId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("InternshippClass.Models.Entities.VocationalGroup", "VocationalGroup")
                        .WithMany()
                        .HasForeignKey("VocationalGroupId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Discipline");

                    b.Navigation("VocationalGroup");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Learner", b =>
                {
                    b.HasOne("InternshippClass.Models.Entities.VocationalGroup", "VocationalGroup")
                        .WithMany("Learners")
                        .HasForeignKey("VocationalGroupId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("VocationalGroup");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Mark", b =>
                {
                    b.HasOne("InternshippClass.Models.Entities.Discipline", "Discipline")
                        .WithMany("Marks")
                        .HasForeignKey("DisciplineId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("InternshippClass.Models.Entities.Learner", "Learner")
                        .WithMany("Marks")
                        .HasForeignKey("LearnerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Discipline");

                    b.Navigation("Learner");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.PermissionsToRoles", b =>
                {
                    b.HasOne("InternshippClass.Models.Entities.Permission", "Permission")
                        .WithMany()
                        .HasForeignKey("PermissionId");

                    b.HasOne("InternshippClass.Models.Entities.Role", "Role")
                        .WithMany()
                        .HasForeignKey("RoleId");

                    b.Navigation("Permission");

                    b.Navigation("Role");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.UserToVocationalGroup", b =>
                {
                    b.HasOne("Provolone.Domains.Entities.User", "User")
                        .WithMany()
                        .HasForeignKey("UserId");

                    b.HasOne("InternshippClass.Models.Entities.VocationalGroup", "VocationalGroup")
                        .WithMany()
                        .HasForeignKey("VocationalGroupId");

                    b.Navigation("User");

                    b.Navigation("VocationalGroup");
                });

            modelBuilder.Entity("Provolone.Domains.Entities.User", b =>
                {
                    b.HasOne("InternshippClass.Models.Entities.Discipline", "Discipline")
                        .WithMany("Users")
                        .HasForeignKey("DisciplineId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("InternshippClass.Models.Entities.Role", "Role")
                        .WithOne("Users")
                        .HasForeignKey("Provolone.Domains.Entities.User", "RoleId");

                    b.Navigation("Discipline");

                    b.Navigation("Role");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Discipline", b =>
                {
                    b.Navigation("Marks");

                    b.Navigation("Users");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Field", b =>
                {
                    b.Navigation("Disciplines");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Learner", b =>
                {
                    b.Navigation("Marks");
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.Role", b =>
                {
                    b.Navigation("Users")
                        .IsRequired();
                });

            modelBuilder.Entity("InternshippClass.Models.Entities.VocationalGroup", b =>
                {
                    b.Navigation("Learners");
                });
#pragma warning restore 612, 618
        }
    }
}
