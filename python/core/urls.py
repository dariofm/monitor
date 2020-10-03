from django.conf.urls import url
from core import views

urlpatterns = [
    url(r'^(?P<user>[0-9]+)$', views.configuracoes, name='configuracoes'),
]
