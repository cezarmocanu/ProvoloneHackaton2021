using InternshippClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;


namespace InternshipClass.Tests
{
    public class StartupTests
    {
        [Fact]
        public void ShouldConvertUrlToHerokuString()
        {
            // Assume
            string url = "postgres://lahfxayyxkqdap:62a39367cf5520aa4a0f653a8a07bf5218e7c1db24a5615901bc208eefe525c3@ec2-99-80-200-225.eu-west-1.compute.amazonaws.com:5432/db4inqqosbftsl";
            // Act
            var herokuConnectionString = Startup.ConvertDatabaseUrlToHerokuString(url);
            // Assert
            Assert.Equal("Server=ec2-99-80-200-225.eu-west-1.compute.amazonaws.com;Port=5432;Database=db4inqqosbftsl;User Id=lahfxayyxkqdap;Password=62a39367cf5520aa4a0f653a8a07bf5218e7c1db24a5615901bc208eefe525c3;Pooling=true;SSL Mode=Require;Trust Server Certificate=True;"
                , herokuConnectionString);
        }

        [Fact]
        public void ShouldThrowExceptionOnCorruptUrl()
        {
            // Assume
            var url = "Server=127.0.0.1;Port=5432;Database=internshipclass;User Id=internshipclassadmin;Password=Usn5FfpifcqTJFcMmjii;";

            // Act & Assert
            var exception = Assert.Throws<FormatException>(() => Startup.ConvertDatabaseUrlToHerokuString(url));

            Assert.StartsWith("Database Url is not right format! Check this", exception.Message);
        }
    }
}
