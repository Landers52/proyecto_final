from django.shortcuts import render

def index(request):
    template_name = 'index.html'
    return render(request, template_name)

def contacto(request):
    template_name = 'contacto.html'
    return render(request, template_name)

def acercade(request):
    template_name = 'acercade.html'
    return render(request, template_name)