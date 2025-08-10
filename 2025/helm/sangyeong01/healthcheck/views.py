from django.http import JsonResponse


def github_view(request, github_username):
    return JsonResponse({"message": f"Hello from {github_username}!"})


def healthcheck_view(request):
    return JsonResponse({"status": "ok"})
