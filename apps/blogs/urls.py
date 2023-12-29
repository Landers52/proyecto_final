from django.urls import path

from .views import AgregarCategoria,AgregarBlog,ListarBlogs, ListarCategorias,ModificarBlog,EliminarBlog,blog_detalle, listar_por_categoria, ordenar_por


app_name='apps.blogs'


urlpatterns = [
    path("agregar_categoria/", AgregarCategoria.as_view(), name='agregar_categoria'),
    path("agregar_blog/", AgregarBlog.as_view(), name='agregar_blog'),
    path("listar_blogs/", ListarBlogs.as_view(), name='listar_blogs'),
    path("listar_categorias/", ListarCategorias.as_view(),name='listar_categorias'),
    path("modificar_blog/<int:pk>", ModificarBlog.as_view(), name='modificar_blog'),
    path("eliminar_blog/<int:pk>", EliminarBlog.as_view(), name='eliminar_blog'),
    path("detalle_blog/<int:id>", blog_detalle, name='detalle_blog'),
    path("listar_por_categoria/<str:categoria>", listar_por_categoria, name='listar_por_categoria'),
    path("ordenar_por/", ordenar_por, name='ordenar_por'),    
]