from django.db import models

class Connect(models.Model):
    name = models.TextField(default='')
    mac_address = models.TextField(default='')
    bluetooth_id = models.TextField(default='')
