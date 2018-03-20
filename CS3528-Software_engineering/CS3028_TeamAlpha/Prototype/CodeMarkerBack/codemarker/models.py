from django.utils.encoding import python_2_unicode_compatible
from django_mysql.models import EnumField
from django.utils import timezone
from django.conf import settings
from django.db import models
import datetime


# Create your models here.


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

    def __str__(self):
        return self.question_text


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.choice_text

    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)


class Course(models.Model):
    name = models.CharField(max_length=100, null=False)
    description = models.CharField(max_length=400)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def was_published_recently(self):
        return self.created_at >= timezone.now() - datetime.timedelta(days=1)

    class Meta:
        ordering = ('created_at',)


class Resource(models.Model):
    filename = models.CharField(max_length=100, null=False)
    content_type = models.CharField(max_length=400)

    data = models.BinaryField(null=False)

    status = EnumField(choices=['start', 'in_progress', 'complete'])

    assessment = models.ForeignKey(
        'Assessment',
        on_delete=models.CASCADE,
        null=False,
        default=None,
        related_name="resources"
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Assessment(models.Model):
    name = models.CharField(max_length=400, null=False)
    description = models.CharField(max_length=1000, default="")
    additional_help = models.CharField(max_length=1000, default="")

    resource = models.ForeignKey(
        Resource,
        on_delete=models.CASCADE,
        default=None,
        related_name="resources",
        null=True
    )

    course = models.ForeignKey(
        Course,
        null=False,
        related_name="assessments"
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return '%d %s %s' % (self.id, self.name, self.description)


class Submission(models.Model):
    filename = models.FileField(upload_to='submissions/')
    content_type = models.CharField(max_length=400)
    data = models.BinaryField(null=False)

    timeTaken = models.DecimalField(null=False, default=0, decimal_places=4, max_digits=4)

    status = EnumField(choices=['start', 'in_progress', 'complete'])
    result = EnumField(choices=['pass', 'fail', 'error'])

    marks = models.IntegerField()
    output = models.TextField

    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        null=False
    )
    assessment = models.ForeignKey(
        Assessment,
        on_delete=models.CASCADE,
        null=False,
        related_name="submissions"
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
