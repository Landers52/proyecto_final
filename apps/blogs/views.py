from typing import Any
from django.db.models.query import QuerySet
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views.generic import ListView, DetailView
from django.urls import reverse_lazy,reverse

from .models import Categoria, Blogs
from apps.opiniones.models import Opinion
from apps.opiniones.forms import OpinionForm


class AgregarCategoria(CreateView):
    model = Categoria
    fields = ['nombre', 'imagen']
    template_name = 'blogs/agregar_categoria.html'
    success_url = reverse_lazy('inicio')

class AgregarBlog(CreateView):
    model = Blogs
    fields = ['titulo', 'texto', 'imagen', 'categoria']
    template_name = 'blogs/agregar_blog.html'
    success_url = reverse_lazy('inicio')

    def form_valid(self,form):
        form.instance.colaborador = self.request.user
        return super().form_valid(form)
    
class ModificarBlog(UpdateView):
    model = Blogs
    fields = ['titulo', 'texto', 'imagen', 'categoria']
    template_name = 'blogs/agregar_blog.html'
    success_url = reverse_lazy('inicio')

class ListarBlogs(ListView):
    model = Blogs
    template_name = 'blogs/listar_blogs.html'
    context_object_name = 'blogs'
    paginate_by = 3

    def get_context_data(self) :
        context = super().get_context_data()
        categorias = Categoria.objects.all()
        context['categorias'] = categorias

        # Check if 'buscador' parameter exists in the request
        query = self.request.GET.get('buscador')
        if query:
            # Filter by title if search query exists
            blogs_found = Blogs.objects.filter(titulo__icontains=query).count()
            context['search_query'] = query
            context['blogs_found'] = blogs_found
        else:
            context['search_query'] = None
            context['blogs_found'] = None

        return context
    
    def get_queryset(self):
        queryset = super().get_queryset()

        # Filter by date
        queryset = queryset.order_by('-fecha_agregado')

        # Filter by title if 'buscador' parameter exists in the request
        query = self.request.GET.get('buscador')
        if query:
            queryset = queryset.filter(titulo__icontains=query)
        
        return queryset 

class ListarCategorias(ListView):
    model = Blogs
    template_name = 'blogs/listar_categorias.html'
    context_object_name = 'blogs'

    def get_context_data(self) :
        context = super().get_context_data()
        categorias = Categoria.objects.all()
        context['categorias'] = categorias
        return context


class EliminarBlog(DeleteView):
    model = Blogs
    template_name = 'blogs/confirma_eliminar.html'
    success_url = reverse_lazy('inicio')

def blog_detalle(request,id):
    blog = Blogs.objects.get(id=id)
    opiniones = Opinion.objects.filter(blog=id)
    form = OpinionForm(request.POST)

    if form.is_valid():
        if request.user.is_authenticated:
            aux = form.save(commit=False)
            aux.blog = blog
            aux.usuario = request.user
            aux.save()
            detalle_url = reverse('apps.blogs:detalle_blog', kwargs={'id': blog.id})
            return HttpResponseRedirect(detalle_url)
        else:
            return redirect('apps.usuarios:iniciar_sesion')
    
    contexto = {
        'blog': blog,
        'form': form,
        'opiniones': opiniones
    }
    template_name = 'blogs/blog_detalle.html'
    return render(request,template_name,contexto)

def listar_por_categoria(request, categoria):
    categoria = Categoria.objects.filter(nombre = categoria)
    blogs = Blogs.objects.filter(categoria = categoria[0].id).order_by('fecha_agregado')
    categorias = Categoria.objects.all()
    template_name = 'blogs/listar_blogs.html'
    contexto = {
        'blogs' : blogs,
        'categorias' : categorias        
    }
    return render(request,template_name,contexto)

# -----------Ejemplo de : Ordenar por  ----------------------

def ordenar_por(request):
    orden = request.GET.get('orden', '')  # Get the selected ordering value

    if orden == 'fecha_asc':
        blogs = Blogs.objects.order_by('fecha_agregado')
    elif orden == 'fecha_desc':
        blogs = Blogs.objects.order_by('-fecha_agregado')
    elif orden == 'titulo_asc':
        blogs = Blogs.objects.order_by('titulo')
    elif orden == 'titulo_desc':
        blogs = Blogs.objects.order_by('-titulo')
    else:
        blogs = Blogs.objects.all()

    categorias = Categoria.objects.all()
    template_name = 'blogs/listar_blogs2.html'
    contexto = {
        'blogs': blogs,
        'categorias': categorias,
    }
    return render(request, template_name, contexto)

