from django.db import models
from apps.usuarios.models import Usuarios
from apps.blogs.models import Blogs

# Create your models here.
class Opinion(models.Model):
    usuario = models.ForeignKey(Usuarios, on_delete=models.CASCADE)
    blog = models.ForeignKey(Blogs, on_delete=models.CASCADE)
    texto = models.TextField()
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.texto
    
    class Meta:
        ordering = ['-fecha']