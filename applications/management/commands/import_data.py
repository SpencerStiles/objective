# applications/management/commands/import_data.py
import json
from django.core.management.base import BaseCommand
from applications.models import Job, Applicants, Skill
from django.db import transaction

class Command(BaseCommand):
    help = 'Imports data from data.json into the database'

    def handle(self, *args, **options):
        try:
            # First, read the data
            with open('data.json', 'r', encoding='utf-8') as file:
                data = json.load(file)
            
            # Start a new transaction
            with transaction.atomic():
                # Clear existing data
                self.clear_existing_data()
                
                # Import data
                self.import_data(data)
                
            self.stdout.write(self.style.SUCCESS('Successfully imported all data!'))

        except Exception as e:
            self.stdout.write(self.style.ERROR(f'An error occurred: {e}'))
            raise

    def clear_existing_data(self):
        """Clear existing data from tables."""
        try:
            Skill.objects.all().delete()
            Applicants.objects.all().delete()
            Job.objects.all().delete()
            self.stdout.write(self.style.SUCCESS('Cleared existing data'))
        except Exception as e:
            self.stdout.write(self.style.WARNING(f'Could not clear existing data: {e}'))

    def import_data(self, data):
        """Import data into the database."""
        # Import jobs
        job_map = {}
        for job_data in data['jobs']:
            try:
                job = Job.objects.create(name=job_data['name'])
                job_map[job_data['id']] = job.id
                self.stdout.write(self.style.SUCCESS(f'Created job: {job.name}'))
            except Exception as e:
                self.stdout.write(self.style.ERROR(f'Error creating job {job_data.get("name")}: {e}'))
                raise

        # Import applicants
        applicant_map = {}
        for applicant_data in data['applicants']:
            try:
                job_id = job_map.get(applicant_data['job_id'])
                if not job_id:
                    raise ValueError(f'Invalid job_id: {applicant_data["job_id"]}')
                    
                applicant = Applicants.objects.create(
                    name=applicant_data['name'],
                    email=applicant_data['email'],
                    website=applicant_data.get('website', ''),
                    cover_letter=applicant_data.get('cover_letter', ''),
                    job_id=job_id
                )
                applicant_map[applicant_data['id']] = applicant.id
                self.stdout.write(self.style.SUCCESS(f'Created applicant: {applicant.name}'))
            except Exception as e:
                self.stdout.write(self.style.ERROR(f'Error creating applicant {applicant_data.get("name")}: {e}'))
                raise

        # Import skills
        for skill_data in data['skills']:
            try:
                applicant_id = applicant_map.get(skill_data['applicant_id'])
                if not applicant_id:
                    raise ValueError(f'Invalid applicant_id: {skill_data["applicant_id"]}')
                    
                skill = Skill.objects.create(
                    name=skill_data['name'],
                    applicant_id=applicant_id
                )
                self.stdout.write(self.style.SUCCESS(f'Created skill: {skill.name}'))
            except Exception as e:
                self.stdout.write(self.style.ERROR(f'Error creating skill: {e}'))
                raise