# applications/models.py
from django.db import models

class Job(models.Model):
    name = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'job'

    def __str__(self):
        return self.name or "Unnamed Job"

class Applicants(models.Model):
    name = models.TextField(blank=True, null=True)
    email = models.TextField(blank=True, null=True)
    website = models.TextField(blank=True, null=True)
    cover_letter = models.TextField(blank=True, null=True)
    job = models.ForeignKey(Job, models.DO_NOTHING, db_column='job_id', 
                          blank=True, null=True, related_name='applicants')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'applicants'

    def __str__(self):
        return self.name or "Unnamed Applicant"

class Skill(models.Model):
    name = models.TextField(blank=True, null=True)
    applicant = models.ForeignKey(Applicants, models.DO_NOTHING, 
                                db_column='applicant_id', 
                                blank=True, 
                                null=True, 
                                related_name='skills')  # Add this line
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'skill'

    def __str__(self):
        return self.name or "Unnamed Skill"