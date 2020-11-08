using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR;
using UnityEngine.XR.ARFoundation;
using UnityEngine.XR.ARSubsystems;

[RequireComponent(typeof(ARTrackedImageManager))]
public class TargetTracking : MonoBehaviour
{
    [SerializeField]
    private GameObject[] prefabs;

    private string prefabName;

    private readonly Dictionary<string, GameObject> prefabsMap = new Dictionary<string, GameObject>();
    private ARTrackedImageManager trackedImageManager;

    private void Awake()
    {
        trackedImageManager = FindObjectOfType<ARTrackedImageManager>();

        foreach (GameObject prefab in prefabs)
        {
            GameObject newPrefab = Instantiate(prefab, Vector3.zero, Quaternion.identity);
            newPrefab.name = prefab.name;
            newPrefab.SetActive(false);
            prefabsMap.Add(prefab.name, newPrefab);
        }
    }

    private void OnEnable()
    {
        trackedImageManager.trackedImagesChanged += TargetChanged;
    }

    private void OnDisable()
    {
        trackedImageManager.trackedImagesChanged -= TargetChanged;
    }

    private void TargetChanged(ARTrackedImagesChangedEventArgs args)
    {
        foreach (ARTrackedImage trackedImage in args.added)
        {
            UpdateScene(trackedImage);
        }
        foreach (ARTrackedImage trackedImage in args.updated)
        {
            UpdateScene(trackedImage);
        }
        foreach (ARTrackedImage trackedImage in args.removed)
        {
            prefabsMap[prefabName].SetActive(false);
        }
    }

    private void UpdateScene(ARTrackedImage trackedImage)
    {
        GameObject prefab = prefabsMap[prefabName];
        if (trackedImage.trackingState != TrackingState.None)
        {
            prefab.transform.position = trackedImage.transform.position;
            prefab.SetActive(true);

            foreach (GameObject gameObject in prefabsMap.Values)
            {
                if (gameObject.name != prefabName)
                {
                    gameObject.SetActive(false);
                }
            }
        }
        else
        {
            prefab.SetActive(false);
        }
    }

    public void SetPrefabName(string prefabName)
    {
        this.prefabName = prefabName;
    }
}
