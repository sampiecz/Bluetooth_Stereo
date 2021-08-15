from django.shortcuts import render


def index(request):
    context = {
        "props": {
            # "connects": json.loads(projects),
            "connects": "Test",
        }, 
    }
    return render(request, 'connect/index.html', context)

