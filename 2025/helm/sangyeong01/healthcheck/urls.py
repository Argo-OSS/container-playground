# myapi/urls.py

from django.urls import path
from . import views

urlpatterns = [
    path("api/v1/<str:github_username>/", views.github_view, name="github_view"),
    path("healthcheck/", views.healthcheck_view, name="healthcheck"),
]
