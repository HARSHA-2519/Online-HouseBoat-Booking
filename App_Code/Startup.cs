using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HouseBoatBooking.Startup))]
namespace HouseBoatBooking
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
