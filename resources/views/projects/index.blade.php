<x-layouts.app>

    {{-- @foreach ($this->projects as $project)
        <li>
            <a href="{{ route('projects.show', $project) }}">
                {{ $project->id }}. {{ $project->title }}
            </a>
        </li>
    @endforeach --}}

    <livewire:projects.index />

</x-layouts.app>
