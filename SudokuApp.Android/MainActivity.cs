using Android.App;
using Android.Content.PM;
using Avalonia.Android;
using Avalonia;

namespace SudokuApp.Android
{
    [Activity(Label = "SudokuApp.Android", Theme = "@style/MyTheme.NoActionBar", Icon = "@drawable/icon", LaunchMode = LaunchMode.SingleInstance, ConfigurationChanges = ConfigChanges.Orientation | ConfigChanges.ScreenSize)]
    public class MainActivity : AvaloniaActivity<App>
    {
        protected override AppBuilder CustomizeAppBuilder(AppBuilder builder)
        {
            var a = base.CustomizeAppBuilder(builder);
            AppBuilder.Configure<App>().UseAvaloniaModules();
            //a.UseAvaloniaModules();
            return a;
        }
    }
}
