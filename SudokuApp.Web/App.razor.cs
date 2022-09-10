using Avalonia.Web.Blazor;

namespace SudokuApp.Web;

public partial class App
{
    protected override void OnParametersSet()
    {
        base.OnParametersSet();
        
        WebAppBuilder.Configure<SudokuApp.App>()
            .SetupWithSingleViewLifetime();
    }
}