from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from apps.blogs.views import ListarBlogs

from .views import *

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", ListarBlogs.as_view(), name = 'inicio'),
    path("usuarios/", include('apps.usuarios.urls')),
    path("blogs/", include('apps.blogs.urls')),
    path("opiniones/", include('apps.opiniones.urls')),
    path("contacto/", contacto, name= 'contacto'),
    path("acercade/", acercade, name= 'acercade'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.STATIC_URL, document_root = settings.STATIC_ROOT)