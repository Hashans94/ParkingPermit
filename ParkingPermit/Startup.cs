using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ParkingPermit.Startup))]
namespace ParkingPermit
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
